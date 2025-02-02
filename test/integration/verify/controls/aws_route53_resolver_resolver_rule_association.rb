resolver_rule_association_id = attribute("resolver_rule_association_id", default: "", description: "")
resolver_rule_id = attribute("resolver_rule_id", default: "", description: "")
re_vpc_id = attribute("re_vpc_id", default: "", description: "")

control 'aws-route53-resolver-resolver-rule-association-1.0' do
    impact 1.0
    title 'Describes the rule association of the route53 resolver.'
  
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: resolver_rule_association_id) do
        it { should exist }
    end

    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: resolver_rule_association_id) do
        its('id') { should eq resolver_rule_association_id}
        its('resolver_rule_id') { should eq resolver_rule_id }
        its('vpc_id') { should eq re_vpc_id }
        its('status') { should eq "COMPLETE" }
        its('status_message') { should be_empty }
    end
  
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'dummy') do
        it { should_not exist }
    end
end