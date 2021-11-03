import React from 'react';

import {
  Avatar,
  IconButton,
  ListItem,
  ListItemAvatar,
  ListItemButton,
  ListItemText,
} from '@mui/material';

import FolderIcon from '@mui/icons-material/Folder';
import NavigateNextIcon from '@mui/icons-material/NavigateNext';
import MusicNoteIcon from '@mui/icons-material/MusicNote';
import PodcastsIcon from '@mui/icons-material/Podcasts';
import RadioIcon from '@mui/icons-material/Radio';

import request from '../../../../utils/request';
import FolderLink from './folder-link';

const FolderListItem = ({ type, name, path }) => {
  const playItem = (type, path) => {
    switch(type) {
      case 'directory': return request('playFolder', { folder: path, recursive: true });
      case 'file': return request('playSong', { song_url: path });
      // TODO: Add missing Podcast
      // TODO: Add missing Stream
      default: return;
    }
  }

  return (
    <ListItem
      key={path}
      disablePadding
      secondaryAction={
        type === 'directory'
          ? <IconButton
              component={FolderLink}
              data={{ dir: path }}
              edge="end"
              aria-label="Show folder content"
            >
              <NavigateNextIcon />
            </IconButton>
          : undefined
      }
    >
      <ListItemButton onClick={() => playItem(type, path)}>
        <ListItemAvatar>
          <Avatar>
            {type === 'directory' && <FolderIcon />}
            {type === 'file' && <MusicNoteIcon />}
            {type === 'podcast' && <PodcastsIcon />}
            {type === 'stream' && <RadioIcon />}
          </Avatar>
        </ListItemAvatar>
        <ListItemText
          primary={name}
        />
      </ListItemButton>
    </ListItem>
  );
}

export default FolderListItem;