require 'station'
describe Station do
  it 'can create instance of Station class' do
    expect(subject).to be_kind_of(Station)
  end

  it 'show the station_name' do
    expect(subject.station_name).to eq('')
  end

  it 'show the zone it belongs' do
    expect(subject.zone).to eq('')
  end
  
end
