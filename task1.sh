#!/bin/bash

set -x

run_task(){
	INPUT_OVERRIDE=${1}
	aws ecs run-task \
		--cluster agent-fargate-cluster \
		--task-definition agent-batch-export-activity-salesforce \
		--overrides "{\"name\":\"agent-batch-export-activity-salesforce\",\"environment\":[{\"name\":\"INPUT\",\"value\":\"$INPUT_OVERRIDE\"}]}" \
		--count 1 \
		--launch-type FARGATE \
		--network-configuration "{\"awsvpcConfiguration\":{\"subnets\":[\"subnet-0168d996eef694152\",\"subnet-0bd2e260bf2586d1f\",\"subnet-091381f22201a84bb\"],\"securityGroups\":[\"sg-053c9d616dfd01730\"],\"assignPublicIp\":\"ENABLED\"}}"
}

main(){
	run_task input_override1
	run_task input_override2
}

main
