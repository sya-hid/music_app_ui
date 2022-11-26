class SongModel {
  final String? idSong, singer, title, songUrl, image, lyric;
  final List<String>? likes;

  SongModel(
      {this.idSong,
      this.singer,
      this.title,
      this.songUrl,
      this.image,
      this.lyric,
      this.likes});
}

List<SongModel> listSongs = [
  SongModel(
    idSong: 'id_song1',
    singer: 'Adele',
    title: 'Easy On Me',
    songUrl: 'Adele-EasyOnMe(OfficialLyricVideo).mp3',
    image: 'Adele - Easy On Me (Official Lyric Video).jpg',
    lyric: 'Adele - Easy On Me (Official Lyric Video).lrc',
    likes: [
      'user1',
      'user2',
      'user3',
      'user4',
    ],
  ),
  SongModel(
    idSong: 'id_song2',
    title: 'Sang Dewi',
    singer: 'Lyodra, Andi Rianto',
    songUrl: 'Lyodra,AndiRianto-SangDewi(OfficialLyricVideo).mp3',
    image: 'Lyodra, Andi Rianto - Sang Dewi (Official Lyric Video).jpg',
    lyric: '',
    likes: [
      'user2',
      'user3',
      'user4',
    ],
  ),
  SongModel(
    idSong: 'id_song3',
    title: 'Lebih Dari Egoku',
    singer: 'Mawar de Jongh',
    songUrl: 'MawardeJongh-LebihDariEgoku-OfficialMusicVideo.mp3',
    image: 'Mawar de Jongh - Lebih Dari Egoku - Official Music Video.jpg',
    lyric: 'Mawar de Jongh - Lebih Dari Egoku - Official Music Video.lrc',
    likes: [
      'user2',
      'user3',
      'user4',
    ],
  ),
  SongModel(
    idSong: 'id_song4',
    title: 'Bertaut',
    singer: 'Nadin Amizah',
    songUrl: 'NadinAmizah-Bertaut(OfficialMusicVideo).mp3',
    image: 'Nadin Amizah - Bertaut (Official Music Video).jpg',
    lyric: 'Nadin Amizah - Bertaut (Official Music Video).lrc',
    likes: [
      'user2',
      'user3',
    ],
  ),
  SongModel(
    idSong: 'id_song5',
    title: 'Lathi',
    singer: 'Weird Genius ft. Sara Fajira',
    songUrl: 'WeirdGenius-Lathi(ft.SaraFajira)OfficialMusicVideo.mp3',
    image: 'Weird Genius - Lathi (ft. Sara Fajira) Official Music Video.jpg',
    lyric: 'Weird Genius - Lathi (ft. Sara Fajira) Official Music Video.lrc',
    likes: [
      'user2',
      'user3',
    ],
  ),
  SongModel(
    idSong: 'id_song6',
    title: 'Cukup Tau',
    singer: 'Rizky Febian',
    songUrl: 'RizkyFebian-CukupTau(OfficialMusicVideo).mp3',
    image: 'Rizky Febian - Cukup Tau (Official Music Video).png',
    lyric: 'Rizky Febian - Cukup Tau (Official Music Video).lrc',
    likes: [
      'user2',
      'user3',
      'user4',
    ],
  ),
  SongModel(
    idSong: 'id_song7',
    title: 'Tak Ingin Usai',
    singer: 'Keisya Levronka',
    songUrl: 'KeisyaLevronka-TakInginUsaiOfficialLyricVideo.mp3',
    image: 'Keisya Levronka - Tak Ingin Usai Official Lyric Video.png',
    lyric: 'Keisya Levronka - Tak Ingin Usai Official Lyric Video.lrc',
    likes: [
      'user2',
    ],
  ),
];
