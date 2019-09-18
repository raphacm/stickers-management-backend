class AddAlbums < ActiveRecord::Migration[6.0]
  def up
    Album.create(
      name: 'Brasileirão 2019 Séries A e B',
      description: 'Álbum Oficial do Campeonato Brasileiro 2019 Séries A e B',
      number_of_stickers: 450
    )
    Album.create(
      name: 'Flamengo 2019',
      description: 'Álbum Oficial do Flamengo',
      number_of_stickers: 300
    )
    Album.create(
      name: 'Pocahontas',
      description: 'Álbum Oficial da Pocahontas',
      number_of_stickers: 250
    )
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
