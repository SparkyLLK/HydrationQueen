# Usage
# Run the script with the arguments in this order
# 1 - SMTP Server
# 2 - From Address
# 3 - To Addresse(s)
# Variables & Parameters

#current time
$time = (Get-Date).ToString('HH:mm')

#email stuff
$efrom = $args[1]
$eto = @($args[2])
$esub = "THIS HAS NOT GONE TO PLAN"
$eserv = $args[0]
$ebod = "THIS HAS NOT GONE TO PLAN"

# Water Quotes
$waterQuotes = @(
    "Ocean waves may be powerful, but they always return to the shore with grace.",
    "Like a river flows, let your life find its course with purpose and determination.",
    "In the vastness of the sea, find the boundless strength within yourself.",
    "Rivers carve through mountains not with force, but with persistence.",
    "Dance with the raindrops and embrace the storms, for they bring growth and renewal.",
    "Be like water, adapting to any situation while maintaining your true essence.",
    "In still waters, find reflection. In rushing waters, find strength.",
    "Life is a continuous ebb and flow; learn to navigate its currents with resilience.",
    "The ocean's depth holds mysteries, just as the depth of your soul reveals untold strength.",
    "Water teaches us to go with the flow, for in that surrender, we find our true power.",
    "A drop of water may seem insignificant, but together, drops can carve canyons.",
    "The calm surface of a lake hides the depths of its wisdom.",
    "Like a gentle stream, let your kindness and compassion flow to nourish those around you.",
    "Storms may rage, but they bring the promise of a clearer sky and a brighter day.",
    "The ocean whispers secrets to those who listen with their hearts.",
    "Be a fountain of positivity, uplifting others with the pureness of your spirit.",
    "Water mirrors the sky; reflect the beauty around you in your actions and words.",
    "Life's challenges are waves; surf them with courage and grace.",
    "A river never goes backward; embrace progress and let go of the past.",
    "In the fluidity of water, discover the strength to overcome obstacles in your path.",
    "Ripples of kindness have the power to create waves of positive change.",
    "A rainstorm may obscure the sun, but it also nourishes the earth and brings growth.",
    "Learn from the river; obstacles become opportunities as it finds its way around them.",
    "Waterfalls may cascade, but each drop contributes to the beauty of the whole.",
    "Find stillness within, even when the world around you is in constant motion.",
    "Life's journey is a river; navigate it with joy, and let laughter be your guide.",
    "Dive into challenges headfirst, for beneath the surface lies the treasure of growth.",
    "Rainbows appear after the storm; your resilience can create beauty from adversity.",
    "In the fluidity of water, find the freedom to shape your own path.",
    "A pond reflects the beauty it contains; let your actions reflect the goodness within you.",
    "Nourish your body, sip by sip, and let the elixir of hydration fuel your journey to vibrant health.",
    "Stay hydrated, not just for your body's sake, but as a commitment to honor the vessel that carries your dreams.",
    "Like a well-watered garden, your body blossoms with vitality when you prioritize hydration.",
    "In the river of life, hydration is the current that keeps your energy flowing and your spirit glowing.",
    "Sip on the elixir of life – water – and watch how it transforms your day, one drop at a time.",
    "Hydration is a gift to yourself, a refreshing oasis in the desert of daily challenges.",
    "In the symphony of self-care, hydration plays a harmonious melody that resonates through body and soul.",
    "Embrace the power of hydration, and let it be the foundation for a wellspring of well-being.",
    "Just as a flower needs water to bloom, your potential unfurls with each hydrating moment.",
    "Drink deeply from the well of hydration; it's the source of clarity, energy, and radiant living.",
    "Water is the essence of life; let each drop be a celebration of your vitality.",
    "Hydration is a daily commitment to self-love, a promise to care for your body and mind.",
    "Like a well-tended garden, your well-hydrated body blossoms with strength and resilience.",
    "In the river of well-being, let hydration be the constant flow that carries you to your best self.",
    "Hydration is the foundation of balance, helping you find equilibrium in the dance of life.",
    "Sip by sip, you are not just drinking water; you are savoring the elixir of life's purest moments.",
    "Let your commitment to hydration be a testament to your dedication to a vibrant and energetic life.",
    "In the vast ocean of self-care, hydration is the wave that refreshes and renews your spirit.",
    "Stay hydrated, and let the river of wellness carry you to new shores of health and happiness.",
    "Hydration is a daily ritual, a small act of self-care that creates ripples of well-being in your life."
    "Visit your hydration station and fill up!"
    "While you are already around 60% water, you still have to drink more!"
    "It's really easy to lose steam in the early afternoon. Remind yourself that you're always worth the effort!"
    "Setting SMART goals is really important, almost as much as drinking water!"
    "Be hip, have a sip"
    )

#random quote function
function Get-RandomArrayEntry {
    param (
        [array]$InputArray
    )

    if ($InputArray -eq $null -or $InputArray.Length -eq 0) {
        Write-Host "Error: The input array is empty or null."
        return $null
    }

    $randomIndex = Get-Random -Minimum 0 -Maximum $InputArray.Length
    $randomEntry = $InputArray[$randomIndex]

    return $randomEntry
}

#set esub & ebod

if ($time -like '07*') {
    $esub = "7AM - LET's GO";
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '09*') {
    $esub = "9AM - DRINK UP"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '11*') {
    $esub = "11AM - STAY HYDRATED"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '13*') {
    $esub = "1PM - KEEP GOING"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '15*') {
    $esub = "3PM - REMEMBER YOUR GOAL"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '17*') {
    $esub = "5PM - DON'T STOP"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '19*') {
    $esub = "7PM - ALMOST THERE"
    $ebod = Get-RandomArrayEntry -InputArray $waterQuotes
    }
elseif ($time -like '21*') {
    $esub = "9PM - YOU DID IT"
    $ebod = "I'm so proud of you, you drank all your water. You're officially a Hydrated Queen. Same again tomorrow?"
    }

#send email and whatever
$ebod += " - xoxo HQ"
if ($esub -inotmatch "THIS HAS NOT GONE TO PLAN"){
Send-MailMessage -SmtpServer $eserv -From $efrom -To $eto -Subject $esub -Body $ebod
}