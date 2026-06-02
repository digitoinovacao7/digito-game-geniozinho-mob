import * as React from "react";

const Logo = (props: React.SVGProps<SVGSVGElement>) => (
  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" {...props}>
    <rect 
      x="5" 
      y="7" 
      width="14" 
      height="10" 
      rx="2" 
      stroke="currentColor" 
      strokeWidth="2"
    />
    <line 
      x1="10" 
      y1="12" 
      x2="10" 
      y2="12" 
      stroke="currentColor" 
      strokeWidth="2.5" 
      strokeLinecap="round"
    />
    <line 
      x1="14" 
      y1="12" 
      x2="14" 
      y2="12" 
      stroke="currentColor" 
      strokeWidth="2.5" 
      strokeLinecap="round"
    />
    <line 
      x1="12" 
      y1="7" 
      x2="12" 
      y2="4" 
      stroke="currentColor" 
      strokeWidth="2" 
      strokeLinecap="round"
    />
    <circle cx="12" cy="3" r="1" fill="currentColor"/>
  </svg>
);

export default Logo;