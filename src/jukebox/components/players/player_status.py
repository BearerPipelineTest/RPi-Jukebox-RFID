import logging
import jukebox.cfghandler
from jukebox import publishing

logger = logging.getLogger('jb.players.player_status')
cfg = jukebox.cfghandler.get_handler('jukebox')

class PlayerStatus:
    STATUS = {
        'player': '',
        'playing': False,
        'shuffle': False,
        'repeat': 0,
        'trackid': '',
        'title': '',
        'artist': '',
        'albumartist': '',
        'album': '',
        'timeTotal': 0,
        'timeElapsed': 0,
        'file': '', # required for MPD // check if really is required
        'coverArt': ''
    }

    def __init__(self):
        self._player_status = self.STATUS


    def update(self, **kwargs):
        for key, value in kwargs.items():
            if key in self.STATUS:
                self._player_status[key] = value

        self.publish()


    def publish(self):
        logger.debug(f'Published: {self._player_status}')
        return publishing.get_publisher().send(
            'player_status',
            self._player_status
        )