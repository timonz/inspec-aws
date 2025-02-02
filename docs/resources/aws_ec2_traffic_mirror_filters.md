---
title: About the aws_ec2_traffic_mirror_filters Resource
platform: aws
---

# aws_\ec2_\traffic_\mirror_\filters

Use the `aws_ec2_traffic_mirror_filters` InSpec audit resource to test properties of multiple AWS traffic mirror filters.

## Syntax

An `aws_ec2_traffic_mirror_filters` resource block declares the tests for a set of AWS traffic mirror filters.

    describe aws_ec2_traffic_mirror_filters do
      it { should exist }
    end

## Parameters

This resource does not require any parameters.

## Properties

|Property                      | Description|
| ---                          | --- |
|traffic_mirror_filter_ids     | The ID of a traffic mirror filter. |
|descriptions                  | The description of a traffic mirror filter. |
|tags                          | A list of hashes with each key-value pair corresponding to an traffic mirror filter. |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TrafficMirrorFilter.html)

## Examples

### Test that an EC2 traffic mirror filter exists.

    describe aws_ec2_traffic_mirror_filters do
      it { should exist }
    end

### Test that EC2 traffic mirror filter's description is correct.

    describe aws_ec2_traffic_mirror_filters do
      its('descriptions') { should include 'DESCRIPTION_TEXT' }
    end

### Test that an EC2 traffic mirror has the correct tag.

    describe aws_ec2_traffic_mirror_filters do
      its('tags') { should include 'TAG' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that an entity exists.

    describe aws_ec2_traffic_mirror_filters do
      it { should exist }
    end

Use `should_not` to test that an entity does not exist.

    describe aws_ec2_traffic_mirror_filters do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `EC2:Client:DescribeTrafficMirrorFiltersResult` action with `Effect` set to `Allow`.

See the [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html) documentation for additional information.
