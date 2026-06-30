{
  gtc.music.homeManager.programs.rmpc = {
    enable = true;
    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
          address: "127.0.0.1:6600",
          password: None,
          cache_dir: None,
          on_song_change: None,
          volume_step: 5,
          max_fps: 30,
          scrolloff: 0,
          wrap_navigation: false,
          enable_mouse: true,
          theme: "${./theme.ron}",
          enable_config_hot_reload: true,
          status_update_interval_ms: 1000,
          select_current_song_on_change: false,
          browser_song_sort: [Disc, Track, Artist, Title],
          cava: (
              input: (
                  method: Fifo,
                  source: "/tmp/mpd.fifo",
                  sample_rate: 44100,
                  channels: 2,
                  sample_bits: 16,
              ),
          ),
          tabs: [
              (name: "Home", pane: Split(direction: Horizontal, panes: [
                          (size: "70%", borders: "NONE", pane: Split(direction: Vertical, panes: [
                                      (size: "3", borders: "ALL", border_symbols: Rounded , pane: Pane(QueueHeader())),
                                      (size: "100%", borders: "ALL", border_symbols: Rounded ,pane: Pane(Queue)),
                              ])

                          ),
                          (size: "30%", borders: "NONE", border_symbols: Rounded ,pane: Split(direction: Vertical, panes: [
                                      (size: "0.47r", borders: "TOP | RIGHT | LEFT",
                                          border_symbols: Rounded,
                                          pane: Pane(AlbumArt)),
                                      (size: "100%", borders: "ALL",
                                          border_symbols: Rounded,
                                          border_title: [(kind: Text("Lyrics"), style: (fg: "blue"))],
                                          border_title_position: Top,
                                          border_title_alignment: Right,
                                          pane: Pane(Lyrics)),
                                  ])
                          ),

                      ])
              ),
              (name: "Queue", pane: Split(direction: Vertical, panes: [
                          (size: "2", borders: "TOP | RIGHT | LEFT", border_symbols: Rounded , pane: Pane(QueueHeader())),
                          (size: "100%", borders: "ALL", border_symbols: Rounded,
                                          border_title: [(kind: Property(Song(File)), style: (fg: "gray"))],
                                          border_title_position: Bottom,
                                          border_title_alignment: Right,
                                          pane: Pane(Queue)),
                              ])

              ),
              (name: "Directories", pane: Split(direction: Horizontal,panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Directories)),
                      ])
              ),
              (name: "Artists", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Artists)),
                      ])
              ),
              (name: "Album Artists", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(AlbumArtists)),
                      ])
              ),
              (name: "Albums", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Albums)),
                      ])
              ),
              (name: "Playlists", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Playlists)),
                      ])
              ),
              (name: "Genre", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Browser(root_tag: "genre", separator: ";"))),
                      ])
              ),
              (name: "Search", pane: Split(direction: Horizontal, panes: [
                          (size: "100%", borders: "ALL", border_symbols: Rounded, pane: Pane(Search)),
                      ])
              ),
              (name: "Show",pane: Split(direction: Vertical, panes: [
                          (size: "50%", pane: Split(direction: Horizontal, panes: [
                                      (size: "39%", borders: "ALL", border_symbols: Rounded, pane: Pane(Queue)),
                                      (size: "22%", borders: "ALL", border_symbols: Rounded, pane: Pane(AlbumArt)),
                                      (size: "39%", borders: "ALL",
                                           border_title: [(kind: Text("Lyrics"), style: (fg: "blue"))],
                                           border_title_position: Top,
                                           border_title_alignment: Right,
                                           border_symbols: Rounded,
                                          pane: Pane(Lyrics)),
                                  ])
                          ),
                          (size: "50%", borders: "ALL", border_symbols: Rounded, pane: Pane(Cava)),
                      ])
              ),
          ], 
          )
    '';
  };
}
