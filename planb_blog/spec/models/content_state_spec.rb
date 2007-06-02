require File.dirname(__FILE__) + '/../spec_helper'

module ContentStateSpecHelper
  def stop_the_clock
    @this_instant = Time.now
    Time.stub!(:now).and_return { @this_instant }
  end

  def should_set_content_fields(expectations = {})
    expectations.each { |flag, val| @content.should_receive(:[]=).with(flag, val).and_return(val) }
  end

  alias_method :should_set_content_field, :should_set_content_fields

  def should_change_state_to(statesym)
    expected_state = case statesym
                     when :draft;               ContentState::Draft
                     when :just_published;      ContentState::JustPublished
                     when :published;           ContentState::Published
                     when :draft;               ContentState::Draft
                     when :publication_pending; ContentState::PublicationPending
                     when :withdrawn;           ContentState::Withdrawn
                     when :just_withdrawn;      ContentState::JustWithdrawn
                     when :unclassified;        ContentState::Unclassified
                     when :new; ContentState::New
                     when :ham; ContentState::Ham
                     when :just_marked_as_ham; ContentState::JustMarkedAsHam
                     when :just_marked_as_spam; ContentState::JustMarkedAsSpam
                     when :spam; ContentState::Spam
                     when :presumed_ham; ContentState::PresumedHam
                     when :just_presumed_ham; ContentState::JustPresumedHam
                     when :presumed_spam; ContentState::PresumedSpam
                     else
                       raise "Don't recognize #{statesym.inspect} as a state"
                     end.instance
    @content.should_receive(:state=).with(expected_state)
  end
end

context 'With ContentState::New.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::New.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published false and :published_at nil' do
    should_set_content_fields :published => false, :published_at => nil

    @state.enter_hook(@content)
  end

  specify '#before_save should set content.state to Draft' do
    should_change_state_to :draft
    @state.before_save(@content)
  end

  specify '#change_published_state => true should set published flag and change state to JustPublished' do
    should_set_content_field :published => true
    should_change_state_to :just_published

    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should set published flag' do
    should_set_content_field :published => false
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at and change to PublicationPending' do
    stop_the_clock
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at now should set published_at and change to JustPublished' do
    stop_the_clock
    should_change_state_to :just_published
    should_set_content_field :published_at => Time.now

    @state.set_published_at(@content, Time.now)
  end

  specify '#set_published_at in the past should set published_at and change to JustPublished' do
    stop_the_clock
    should_change_state_to :just_published
    should_set_content_field :published_at => Time.now - 10

    @state.set_published_at(@content, Time.now - 10)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::Draft.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Draft.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published false and set published_at to nil' do
    should_set_content_fields :published => false, :published_at => nil

    @state.enter_hook(@content)
  end

  specify '#before_save should not do anything' do
    @state.before_save(@content)
  end

  specify '#change_published_state => true should set published flag and change state to JustPublished' do
    should_set_content_field :published => true
    should_change_state_to :just_published

    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should set published flag' do
    should_set_content_field :published => false
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at and change to PublicationPending' do
    stop_the_clock
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at <=now should discard the time and set published_at to nil' do
    stop_the_clock
    @content.should_receive(:[]=).with(:published_at, Time.now).ordered
    @content.should_receive(:[]=).with(:published_at, nil).ordered

    @state.set_published_at(@content, Time.now)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::Published.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Published.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published true and sets a nil published_at to Time.now' do
    stop_the_clock
    should_set_content_fields :published => true
    @content.should_receive(:[]).with(:published_at).and_return nil
    @content.should_receive(:[]=).with(:published_at, Time.now)

    @state.enter_hook(@content)
  end

  specify '#before_save should just return true' do
    @state.before_save(@content).should_be true
  end

  specify '#change_published_state => true should not do anything' do
    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should unset the published flag and change state to JustWithdrawn' do
    should_set_content_fields :published => false, :published_at => nil
    should_change_state_to :just_withdrawn
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at and change to PublicationPending' do
    stop_the_clock
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at now should set published_at' do
    stop_the_clock
    should_set_content_field :published_at => Time.now

    @state.set_published_at(@content, Time.now)
  end

  specify '#set_published_at in the past should set published_at' do
    stop_the_clock
    should_set_content_field :published_at => Time.now - 10

    @state.set_published_at(@content, Time.now - 10)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::JustPublished.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::JustPublished.instance
  end

  specify '#just_published? should be true' do
    @state.should_be_just_published
  end

  specify '#just_changed_published_status? should be true' do
    @state.just_changed_published_status?.should_be true
  end

  specify '#enter_hook should set :published true and sets a nil published_at to Time.now' do
    stop_the_clock
    should_set_content_fields :published => true
    @content.should_receive(:[]).with(:published_at).and_return nil
    @content.should_receive(:[]=).with(:published_at, Time.now)

    @state.enter_hook(@content)
  end

  specify '#before_save should just return true' do
    @state.before_save(@content).should_be true
  end

  specify '#change_published_state => true should not do anything' do
    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should unset the published flag and change state to JustWithdrawn' do
    should_set_content_fields :published => false, :published_at => nil
    should_change_state_to :just_withdrawn
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at and change to PublicationPending' do
    stop_the_clock
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at now should set published_at' do
    stop_the_clock
    should_set_content_field :published_at => Time.now

    @state.set_published_at(@content, Time.now)
  end

  specify '#set_published_at in the past should set published_at' do
    stop_the_clock
    should_set_content_field :published_at => Time.now - 10

    @state.set_published_at(@content, Time.now - 10)
  end

  specify '#send_notifications should really send notifications' do
    @content.should_receive(:interested_users).and_return([:bob, :jim])
    @content.should_receive(:send_notification_to_user).with(:bob)
    @content.should_receive(:send_notification_to_user).with(:jim)

    @state.send_notifications(@content)
  end

  specify '#send_pings should call back to @content.really_send_pings' do
    @content.should_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::Withdrawn.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Withdrawn.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published false and set published_at to nil' do
    should_set_content_field :published => false

    @state.enter_hook(@content)
  end

  specify '#before_save should not do anything' do
    @state.before_save(@content)
  end

  specify '#change_published_state => true should set published flag and change state to JustPublished' do
    should_set_content_field :published => true
    should_change_state_to :published

    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should not do anything' do
    @content.should_not_receive(:[]=)
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at, remove any trigger and change to PublicationPending' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at <=now should change the publication time and remove any trigger' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    @content.should_receive(:[]=).with(:published_at, Time.now).ordered

    @state.set_published_at(@content, Time.now)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::JustWithdrawn.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::JustWithdrawn.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be true' do
    @state.just_changed_published_status?.should_be true
  end

  specify '#enter_hook should set :published false' do
    should_set_content_field :published => false

    @state.enter_hook(@content)
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:[]=)
    @state.before_save(@content)
  end

  specify '#change_published_state => true should set published flag and change state to Published' do
    should_set_content_field :published => true
    should_change_state_to :published

    @state.change_published_state(@content, true)
  end

  specify '#change_published_state to false should not do anything' do
    @content.should_not_receive(:[]=)
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at, remove any trigger and change to PublicationPending' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    should_set_content_field :published_at => Time.now + 10
    should_change_state_to :publication_pending

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at <=now should change the publication time and remove any trigger' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    @content.should_receive(:[]=).with(:published_at, Time.now).ordered

    @state.set_published_at(@content, Time.now)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::PublicationPending.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::PublicationPending.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published false for a new record' do
    @content.should_receive(:new_record?).and_return true
    should_set_content_field :published => false

    @state.enter_hook(@content)
  end

  specify '#enter_hook should not touch an existing record' do
    @content.should_receive(:new_record?).and_return false
    @content.should_not_receive(:[]=)

    @state.enter_hook(@content)
  end

  specify '#before_save should not do anything' do
    @state.before_save(@content)
  end

  # I don't quite understand why this works like this... just port the test for now.
  specify '#change_published_state => true should set published flag and change to JustPublished if published_at is in the past' do
    stop_the_clock
    @content.should_receive(:published_at).and_return(Time.now - 10)
    should_change_state_to :just_published

    should_set_content_field :published => true

    @state.change_published_state(@content, true)
  end

  specify '#change_published_state => true should just set the published flag if published_at is in the future' do
    stop_the_clock
    @content.should_receive(:published_at).and_return(Time.now + 10)

    should_set_content_field :published => true

    @state.change_published_state(@content, true)
  end


  specify '#change_published_state to false should unset the flag' do
    should_set_content_field :published => false
    @state.change_published_state(@content, false)
  end

  specify '#set_published_at to the_future should set published_at, remove any trigger and change to PublicationPending' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    should_set_content_field :published_at => Time.now + 10

    @state.set_published_at(@content, Time.now + 10)
  end

  specify '#set_published_at <=now should change the publication time and remove any trigger' do
    stop_the_clock
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    should_set_content_field :published_at => Time.now - 10
    should_change_state_to :just_published

    @state.set_published_at(@content, Time.now - 10)
  end

  specify '#set_published_at <= nil should nil the publication time and change state to Draft' do
    Trigger.should_receive(:remove).with(@content, :trigger_method => 'publish!')
    should_set_content_field :published_at => nil
    should_change_state_to :draft

    @state.set_published_at(@content, nil)
  end

  specify '#send_notifications should not send notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not call back to @content.really_send_pings' do
    @content.should_not_receive(:really_send_pings)

    @state.send_pings(@content)
  end
end

context 'With ContentState::Unclassified.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Unclassified.instance
  end

  specify 'state should stringify as "Unclassified"' do
    @state.to_s.should == 'Unclassified'
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should force content classification' do
    should_force_classification(:published?)
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#mark_as_spam should change to JustMarkedAsSpam' do
    should_change_state_to :just_marked_as_spam
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to JustMarkedAsHam' do
    should_change_state_to :just_marked_as_ham
    @state.mark_as_ham(@content)
  end


  specify '#is_spam? should force content classification' do
    should_force_classification(:is_spam?)
  end

  specify '#enter_hook should set :published and :status_confirmed to false' do
    should_set_content_fields :published => false, :status_confirmed => false

    @state.enter_hook(@content)
  end

  specify '#before_save should force classification' do
    should_force_classification(:before_save)
  end

  specify '#after_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#send_notifications should not do anything' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not do anything' do
    @content.should_not_receive(:anything)
    @state.send_pings(@content)
  end

  def should_force_classification(state_method, expected_result = :ham)
    @content.should_receive(:classify).and_return(expected_result)
    new_state = case expected_result
                when :ham; ContentState::JustPresumedHam.instance
                when :spam; ContentState::JustPresumedSpam.instance
                else ContentState::JustPresumedSpam.instance
                end
    @content.should_receive(:state=).and_return(new_state)
    @state.send(state_method, @content)
  end



end

context 'With ContentState::JustPresumedHam.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::JustPresumedHam.instance
  end

  specify '#just_published? should be true' do
    @state.should_be_just_published
  end

  specify '#published? should be true' do
    @state.should_be_published(@content)
  end

  specify '#just_changed_published_status? should be true' do
    @state.just_changed_published_status?.should_be true
  end

  specify '#enter_hook should set :published to true and :status_confirmed to false' do
    should_set_content_fields :published => true, :status_confirmed => false

    @state.enter_hook(@content)
  end

  specify '#after_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should change state to ContentState::JustMarkedAsSpam' do
    should_change_state_to :just_marked_as_spam
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to ContentState::Ham' do
    should_change_state_to :ham
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Ham?"' do
    @state.to_s.should == 'Ham?'
  end

  specify '#send_notifications should send notifications to interested users' do
    @content.should_receive(:interested_users).and_return([:tom, :dick, :harry])
    @content.should_receive(:send_notification_to_user).with(:tom)
    @content.should_receive(:send_notification_to_user).with(:dick)
    @content.should_receive(:send_notification_to_user).with(:harry)

    @state.send_notifications(@content)
  end

  specify '#send_pings should really send pings' do
    @content.should_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end


context 'With ContentState::PresumedHam.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::PresumedHam.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should be true' do
    @state.should_be_published(@content)
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published to true and :status_confirmed to false' do
    should_set_content_fields :published => true, :status_confirmed => false

    @state.enter_hook(@content)
  end

  specify '#after_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should change state to ContentState::JustMarkedAsSpam' do
    should_change_state_to :just_marked_as_spam
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to ContentState::Ham' do
    should_change_state_to :ham
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Ham?"' do
    @state.to_s.should == 'Ham?'
  end

  specify '#send_notifications should not send any notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not send pings' do
    @content.should_not_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end

context 'With ContentState::Ham.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Ham.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should be true' do
    @state.should_be_published(@content)
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published and :status_confirmed to true' do
    should_set_content_fields :published => true, :status_confirmed => true

    @state.enter_hook(@content)
  end

  specify '#after_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_receive(:report_as_ham)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should change state to ContentState::JustMarkedAsSpam' do
    should_change_state_to :just_marked_as_spam
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should not do anything' do
    @content.should_not_receive(:anything)
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Ham"' do
    @state.to_s.should == 'Ham'
  end

  specify '#send_notifications should not send any notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not send pings' do
    @content.should_not_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end

context 'With ContentState::PresumedSpam.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::PresumedSpam.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should be false' do
    @state.should_not_be_published(@content)
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published and :status_confirmed to false' do
    should_set_content_fields :published => false, :status_confirmed => false

    @state.enter_hook(@content)
  end

  specify '#after_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should change state to ContentState::Spam' do
    should_change_state_to :spam
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to ContentState::JustMarkedAsHam' do
    should_change_state_to :just_marked_as_ham
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Spam?"' do
    @state.to_s.should == 'Spam?'
  end

  specify '#send_notifications should not send any notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not send pings' do
    @content.should_not_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end

context 'With ContentState::JustMarkedAsSpam.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::JustMarkedAsSpam.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should be false' do
    @state.should_not_be_published(@content)
  end

  specify '#just_changed_published_status? should be true' do
    @state.just_changed_published_status?.should_be true
  end

  specify '#enter_hook should set :published false and :status_confirmed to true' do
    should_set_content_fields :published => false, :status_confirmed => true

    @state.enter_hook(@content)
  end

  specify '#after_save should report the feedback as spam' do
    @content.should_receive(:report_as_spam)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should not do anything' do
    @content.should_not_receive(:anything)
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to ContentState::JustMarkedAsHam' do
    should_change_state_to :just_marked_as_ham
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Spam"' do
    @state.to_s.should == 'Spam'
  end

  specify '#send_notifications should not send any notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not send pings' do
    @content.should_not_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end

context 'With ContentState::Spam.instance and mock content' do
  include ContentStateSpecHelper

  setup do
    @content = mock('content')
    @state = ContentState::Spam.instance
  end

  specify '#just_published? should be false' do
    @state.should_not_be_just_published
  end

  specify '#published? should be false' do
    @state.should_not_be_published(@content)
  end

  specify '#just_changed_published_status? should be false' do
    @state.just_changed_published_status?.should_be false
  end

  specify '#enter_hook should set :published false and :status_confirmed to true' do
    should_set_content_fields :published => false, :status_confirmed => true

    @state.enter_hook(@content)
  end

  specify '#after_save should do nothing' do
    @content.should_not_receive(:anything)
    @state.after_save(@content).should_be true
  end

  specify '#before_save should not do anything' do
    @content.should_not_receive(:anything)
    @state.before_save(@content).should_be true
  end

  specify '#mark_as_spam should not do anything' do
    @content.should_not_receive(:anything)
    @state.mark_as_spam(@content)
  end

  specify '#mark_as_ham should change state to ContentState::JustMarkedAsHam' do
    should_change_state_to :just_marked_as_ham
    @state.mark_as_ham(@content)
  end

  specify 'state should stringify as "Spam"' do
    @state.to_s.should == 'Spam'
  end

  specify '#send_notifications should not send any notifications' do
    @content.should_not_receive(:anything)
    @state.send_notifications(@content)
  end

  specify '#send_pings should not send pings' do
    @content.should_not_receive(:really_send_pings)
    @state.send_pings(@content)
  end
end
