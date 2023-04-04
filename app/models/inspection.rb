class Inspection < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :performer, class_name: 'User'
  belongs_to :device

  state_machine :state, initial: :task_created do
    state :task_accepted
    state :verification_successful
    state :verification_failed
    state :sent_to_repair
    state :returned_from_repair

    event :accept_task do
      transition task_created: :task_accepted
    end

    event :complete_verification do
      transition task_accepted: :verification_successful
    end

    event :fail_verification do
      transition task_accepted: :verification_failed
    end

    event :send_to_repair do
      transition verification_failed: :sent_to_repair
    end

    event :return_from_repair do
      transition sent_to_repair: :returned_from_repair
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['conclusion', 'conclusion_date', 'created_at', 'creator_id', 'description', 'device_id', 'id', 'performer_id', 'state', 'updated_at']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['creator', 'device', 'performer']
  end
end
