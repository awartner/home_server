describe http('https://localhost',
              auth: { user: 'admin', pass: 'admin' },
              ssl_verify: false,
              enable_remote_worker: true) do
  its('status') { should eq 200 }
  its('body') { should match(/BackupPC Server Status/) }
end

describe port('53') do
  it { should be_listening }
  its(:protocols) { should include 'tcp' }
  its(:protocols) { should include 'udp' }
end

describe port('25') do
  it { should be_listening }
  its(:protocols) { should include 'tcp' }
end

describe command('smbclient -L localhost -N') do
  its('stdout') { should match(/Shared files/) }
end
