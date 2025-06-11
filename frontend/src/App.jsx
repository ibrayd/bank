import React from 'react'
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import Login from './Login'
import StudentDashboard from './StudentDashboard'
import ProfessorDashboard from './ProfessorDashboard'

function PrivateRoute({ children }) {
  const token = localStorage.getItem('token')
  if (!token) {
    return <Navigate to="/login" />
  }
  return children
}

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route
          path="/student-dashboard"
          element={<PrivateRoute><StudentDashboard /></PrivateRoute>}
        />
        <Route
          path="/professor-dashboard"
          element={<PrivateRoute><ProfessorDashboard /></PrivateRoute>}
        />
        <Route path="*" element={<Navigate to="/login" />} />
      </Routes>
    </BrowserRouter>
  )
}
