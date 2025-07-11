import React, { useState, useEffect } from 'react';
import mqtt from 'mqtt';
import './App.css';

function App() {
  const [gameState, setGameState] = useState(null);
  const [lastMessage, setLastMessage] = useState('');

  useEffect(() => {
    // Fetch initial game state from the API
    fetch('/api/game/state')
      .then(res => res.json())
      .then(data => setGameState(data))
      .catch(err => console.error("Failed to fetch game state:", err));

    // Connect to MQTT broker via WebSockets
    const client = mqtt.connect('ws://localhost:9001');

    client.on('connect', () => {
      console.log('Connected to MQTT broker via WebSocket');
      client.subscribe('game/events');
      client.subscribe('game/state');
    });

    client.on('message', (topic, message) => {
      const msg = `Topic: ${topic}, Message: ${message.toString()}`;
      console.log(msg);
      setLastMessage(msg);

      // If the message is a full game state update, parse and set it
      if (topic === 'game/state') {
        try {
          const newState = JSON.parse(message.toString());
          setGameState(newState);
        } catch (e) {
          console.error("Failed to parse game state from MQTT", e);
        }
      }
    });

    // Cleanup on component unmount
    return () => {
      client.end();
    };
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>Freight Club</h1>
      </header>
      <main>
        <h2>Game State</h2>
        {gameState ? (
          <pre>{JSON.stringify(gameState, null, 2)}</pre>
        ) : (
          <p>Loading game state...</p>
        )}
        <h2>Last MQTT Message</h2>
        <p>{lastMessage || 'No messages received yet.'}</p>
      </main>
    </div>
  );
}

export default App; 