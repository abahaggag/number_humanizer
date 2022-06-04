RSpec.describe NumberHumanizer do
  it "has a version number" do
    expect(NumberHumanizer::VERSION).not_to be nil
  end

  context 'when arabic language is configured' do
    before do
      NumberHumanizer.setup do |config|
        config.language = :arabic
      end
    end

    it 'converts basic numbers correctly' do
      expect(0.to_word).to eq('صفر')
      expect(1.to_word).to eq('واحد')
      expect(2.to_word).to eq('إثنان')
      expect(3.to_word).to eq('ثلاثة')
      expect(4.to_word).to eq('أربعة')
      expect(5.to_word).to eq('خمسة')
      expect(6.to_word).to eq('ستة')
      expect(7.to_word).to eq('سبعة')
      expect(8.to_word).to eq('ثمانية')
      expect(9.to_word).to eq('تسعة')
      expect(10.to_word).to eq('عشرة')
      expect(20.to_word).to eq('عشرون')
      expect(30.to_word).to eq('ثلاثون')
      expect(40.to_word).to eq('أربعون')
      expect(50.to_word).to eq('خمسون')
      expect(60.to_word).to eq('ستون')
      expect(70.to_word).to eq('سبعون')
      expect(80.to_word).to eq('ثمانون')
      expect(90.to_word).to eq('تسعون')
      expect(100.to_word).to eq('مائة')
      expect(200.to_word).to eq('مئتان')
      expect(1_000.to_word).to eq('ألف')
      expect(2_000.to_word).to eq('ألفان')
      expect(1_000_000.to_word).to eq('مليون')
      expect(1_000_000_000.to_word).to eq('مليار')
      expect(1_000_000_000_000.to_word).to eq('بليون')
      expect(1_000_000_000_000_000.to_word).to eq('بليار')
      expect(1_000_000_000_000_000_000.to_word).to eq('تريليون')
      expect(1_000_000_000_000_000_000_000.to_word).to eq('تريليار')
      expect(1_000_000_000_000_000_000_000_000.to_word).to eq('كريليون')
      expect(1_000_000_000_000_000_000_000_000_000.to_word).to eq('كريليار')
      expect(1_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سنكليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سنكليار')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سيزيليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سيزيليار')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سيتليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('سيتليار')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('ويتليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('ويتليار')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('تيفليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('تيفليار')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('ديشليون')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('ديشلي')
    end

    it 'converts numbers with combined segments correctly' do
      expect(11.to_word).to eq('احد عشر')
      expect(12.to_word).to eq('اثنا عشر')
      expect(13.to_word).to eq('ثلاثة عشر')
      expect(14.to_word).to eq('أربعة عشر')
      expect(15.to_word).to eq('خمسة عشر')
      expect(16.to_word).to eq('ستة عشر')
      expect(17.to_word).to eq('سبعة عشر')
      expect(18.to_word).to eq('ثمانية عشر')
      expect(19.to_word).to eq('تسعة عشر')

      expect(101.to_word).to eq('مائة و واحد')
      expect(102.to_word).to eq('مائة و إثنان')
      expect(110.to_word).to eq('مائة و عشرة')
      expect(201.to_word).to eq('مئتان و واحد')
      expect(202.to_word).to eq('مئتان و إثنان')
      expect(230.to_word).to eq('مئتان و ثلاثون')
      expect(301.to_word).to eq('ثلاثة مائة و واحد')
      expect(302.to_word).to eq('ثلاثة مائة و إثنان')
      expect(350.to_word).to eq('ثلاثة مائة و خمسون')
      expect(999.to_word).to eq('تسعة مائة و تسعة و تسعون')
      expect(1_001.to_word).to eq('ألف و واحد')
      expect(1_002.to_word).to eq('ألف و إثنان')
      expect(2_001.to_word).to eq('إثنان ألف و واحد')
      expect(2_002.to_word).to eq('إثنان ألف و إثنان')
      expect(17_006.to_word).to eq('سبعة عشر ألف و ستة')
      expect(201_004.to_word).to eq('مئتان و واحد ألف و أربعة')
      expect(1_000_400.to_word).to eq('مليون و أربعة مائة')
      expect(2_000_345_003.to_word).to eq('إثنان مليار و ثلاثة مائة و خمسة و أربعون ألف و ثلاثة')
      expect(99_100_000_020.to_word).to eq('تسعة و تسعون مليار و مائة مليون و عشرون')
    end
  end
end
