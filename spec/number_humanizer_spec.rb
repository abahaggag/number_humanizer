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

  context 'when english language is configured' do
    before do
      NumberHumanizer.setup do |config|
        config.language = :english
      end
    end

    it 'converts basic numbers correctly' do
      expect(0.to_word).to eq('zero')
      expect(1.to_word).to eq('one')
      expect(2.to_word).to eq('two')
      expect(3.to_word).to eq('three')
      expect(4.to_word).to eq('four')
      expect(5.to_word).to eq('five')
      expect(6.to_word).to eq('six')
      expect(7.to_word).to eq('seven')
      expect(8.to_word).to eq('eight')
      expect(9.to_word).to eq('nine')
      expect(10.to_word).to eq('ten')
      expect(20.to_word).to eq('twenty')
      expect(30.to_word).to eq('thirty')
      expect(40.to_word).to eq('forty')
      expect(50.to_word).to eq('fifty')
      expect(60.to_word).to eq('sixty')
      expect(70.to_word).to eq('seventy')
      expect(80.to_word).to eq('eighty')
      expect(90.to_word).to eq('ninety')
      expect(100.to_word).to eq('hundred')
      expect(200.to_word).to eq('two hundred')
      expect(1_000.to_word).to eq('thousand')
      expect(2_000.to_word).to eq('two thousand')
      expect(1_000_000.to_word).to eq('million')
      expect(1_000_000_000.to_word).to eq('billion')
      expect(1_000_000_000_000.to_word).to eq('trillion')
      expect(1_000_000_000_000_000.to_word).to eq('quadrillion')
      expect(1_000_000_000_000_000_000.to_word).to eq('quintillion')
      expect(1_000_000_000_000_000_000_000.to_word).to eq('sextillion')
      expect(1_000_000_000_000_000_000_000_000.to_word).to eq('septillion')
      expect(1_000_000_000_000_000_000_000_000_000.to_word).to eq('octillion')
      expect(1_000_000_000_000_000_000_000_000_000_000.to_word).to eq('nonillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('decillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('undecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('duodecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('tredecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('quattuordecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('quindecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('sexdecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('septemdecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('octodecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('novemdecillion')
      expect(1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.to_word).to eq('vigintillion')
    end

    it 'converts numbers with combined segments correctly' do
      expect(11.to_word).to eq('eleven')
      expect(12.to_word).to eq('twelve')
      expect(13.to_word).to eq('thirteen')
      expect(14.to_word).to eq('fourteen')
      expect(15.to_word).to eq('fifteen')
      expect(16.to_word).to eq('sixteen')
      expect(17.to_word).to eq('seventeen')
      expect(18.to_word).to eq('eighteen')
      expect(19.to_word).to eq('nineteen')

      expect(99.to_word).to eq('ninety nine')
      expect(101.to_word).to eq('hundred and one')
      expect(102.to_word).to eq('hundred and two')
      expect(110.to_word).to eq('hundred and ten')
      expect(201.to_word).to eq('two hundred and one')
      expect(202.to_word).to eq('two hundred and two')
      expect(230.to_word).to eq('two hundred and thirty')
      expect(301.to_word).to eq('three hundred and one')
      expect(302.to_word).to eq('three hundred and two')
      expect(350.to_word).to eq('three hundred and fifty')
      expect(999.to_word).to eq('nine hundred and ninety nine')
      expect(1_001.to_word).to eq('thousand and one')
      expect(1_002.to_word).to eq('thousand and two')
      expect(2_001.to_word).to eq('two thousand and one')
      expect(2_002.to_word).to eq('two thousand and two')
      expect(17_006.to_word).to eq('seventeen thousand and six')
      expect(66_155.to_word).to eq('sixty six thousand and hundred and fifty five')
      expect(201_004.to_word).to eq('two hundred and one thousand and four')
      expect(1_000_400.to_word).to eq('million and four hundred')
      expect(2_000_345_003.to_word).to eq('two billion and three hundred and forty five thousand and three')
      expect(99_100_000_020.to_word).to eq('ninety nine billion and hundred million and twenty')
    end
  end
end
