import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'

export default function Login() {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const navigate = useNavigate()

  const handleSubmit = async (e) => {
    e.preventDefault()
    const data = new URLSearchParams()
    data.append('username', username)
    data.append('password', password)
    const res = await fetch('/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: data
    })
    if (res.ok) {
      const json = await res.json()
      localStorage.setItem('token', json.access_token)
      const payload = JSON.parse(atob(json.access_token.split('.')[1]))
      if (payload.role === 'professor') {
        navigate('/professor-dashboard')
      } else {
        navigate('/student-dashboard')
      }
    } else {
      alert('Login failed')
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center">
      <form onSubmit={handleSubmit} className="space-y-4">
        <input className="border p-2" placeholder="Username" value={username} onChange={(e) => setUsername(e.target.value)} />
        <input className="border p-2" type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
        <button className="bg-black text-white px-4 py-2" type="submit">Login</button>
      </form>
    </div>
  )
}
