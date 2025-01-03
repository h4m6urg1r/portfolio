import React from "react";
import "../app/globals.css"; // Ensure the global styles are imported

const GradientBar = () => {
  return (
    <div className="fixed bottom-0 left-0 w-full h-8"
      style={{
        background: "linear-gradient(to right, var(--rosewater),var(--flamingo),var(--pink),var(--mauve),var(--red),var(--maroon),var(--peach),var(--yellow),var(--green),var(--teal),var(--blue),var(--sky),var(--lavender))",
		height: ".5rem",
      }}
    >
	  { /* */ }
    </div>
  );
};

export default GradientBar;
