import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import PokemonTeamBuilder from './PokemonTeamBuilder.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <PokemonTeamBuilder />
  </StrictMode>,
)
