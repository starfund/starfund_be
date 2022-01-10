ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
      end
    end

    columns do
      column do
        panel 'SUBSCRIPTIONS' do
          ul do
            last_subs = Subscription.active.where(created_at: 1.month.ago..)
            h3 "Active Last Month - #{last_subs.count}"
            non_active_subs = Subscription.where.not(status: 0)
            cancel_last_month = non_active_subs.where(last_charge: 1.month.ago..)
            h3 "Cancel Last Month - #{cancel_last_month.count}"
            li link_to("See Subscriptions", admin_subscriptions_path)
            br
            br
            active_subs = Subscription.active.count
            h3 "Total active subs - #{active_subs}"
            h3 "Total cancel subs - #{non_active_subs.count}"
          end
        end
      end
      column do
        panel 'REVENUE' do
          ul do
            last_subs = Subscription.where(last_charge_date: 1.month.ago..)
            last_charges = Charge.where(created_at: 1.month.ago..)
            h3 "Eearnings Last Month SUBS - $#{last_subs.sum(:last_charge)/100}"
            h3 "Eearnings Last Month PPVs - $#{last_charges.sum(:amount)/100}"
            li link_to("See Charges", admin_charges_path)
            br
            br
            total_e_subs = Subscription.all.sum(:last_charge)
            total_e_charges = Charge.all.sum(:amount)
            h3 "Total earnings subs - $#{total_e_subs/100}"
            h3 "Total earnings charges - $#{total_e_charges/100}"
            h3 "Total earnings - $#{(total_e_subs + total_e_charges)/100}"
          end
        end
      end
    end

    #   column do
    #     panel 'Info' do
    #       para 'Welcome to ActiveAdmin.'
    #     end
    #   end
    # end
  end
end
