{
    scheduler: {
        type: 'ecs',
        region: 'ap-northeast-1',
        cluster: 'eagletmt',
        desired_count: 2,
        role: 'ecsServiceRole',
        // health_check_grace_period_seconds: 0,
        elb_v2: {
            // NLB can not have
            // * health check path
            // * securit group
            scheme: 'internal',
            type: 'network',
            // VPC id where the target group is located
            vpc_id: 'vpc-WWWWWWWW',
            listeners: [
                {
                    port: 80,
                    protocol: 'TCP',
                },
            ],
            subnets: [
                'subnet-XXXXXXXX',
                'subnet-YYYYYYYY',
            ],
            container_name: 'app',
            container_port: 80,
            // If you want enalbed cross zone load balancing, then specify attribute.
            // load_balancer_attributes: {
            //     'load_balancing.cross_zone.enabled': 'true',
            // },
        },
    },
    app: {
        image: 'nginx',
        memory: 128,
        cpu: 256,
        port_mappings: [
            {
                container_port: 80,
                host_port: 0,
                protocol: 'TCP',
            },
        ],
    },
}
