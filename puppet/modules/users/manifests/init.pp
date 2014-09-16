class users {
	user{ 'debian':
		ensure => 'present',
	} -> 
	user{ 'hon':
		ensure => 'present',
		groups => ['sudo', 'debian'],
		home   => '/home/hon',
		managehome => true,
		password   => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
		shell      => '/bin/bash',
 	}
	file{ '/home/hon':
		ensure => directory,
		owner  => 'hon',
		group  => 'hon',
		mode   => 755,
		source => 'puppet:///modules/users/hon',
		recurse => remote,
		require => User['hon'],
	}
	ssh_authorized_key { 'hon':
		ensure => 'present',
		user   => 'hon',
		type   => 'rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDME2xfePp4c0rxpiQUo94rcFkhVAoa3F7wKipCgqhEkl/0Z+3kgivyeDQwG0LTQk4soZ7f3IQaHL7EMsmf3yZo7X0XM8NI7csuoPCPP3tuIezB8wjb0K3+Y7E5K/LFiHx40TVrWEau5IjRLyVMtyo3ZXalKVxkD3AAM2MQFyhiCZZf1d3+zV33NosANMH1RDQsyZ+Wq3PlHCN1eF2vExO/qMjjfZ4Fpvh/YQAlJvj4xlagk7EBAFkbolIku5V6OtQpVv2zrUh1+3J+UGlcZxiJUPazmY8fBxEBucT69oh0OS1Wh456/R6Rv1CdNaJu51pKBBPF6m7PtphZYadO0gUr',
	}
}
