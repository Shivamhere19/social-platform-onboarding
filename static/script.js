const steps = document.querySelectorAll(".step");
const nextBtns = document.querySelectorAll(".next-btn");
const prevBtns = document.querySelectorAll(".prev-btn");

let currentStep = 0;

showStep(currentStep);

function showStep(step){

    steps.forEach((item)=>{
        item.classList.remove("active");
    });

    steps[step].classList.add("active");

    updateProgressBar();
}

function updateProgressBar(){

    const progress = document.querySelector(".progress");

    let percent = 0;

    if(currentStep === 0){
        percent = 33;
    }
    else if(currentStep === 1){
        percent = 66;
    }
    else{
        percent = 100;
    }

    progress.style.width = percent + "%";
}

function validateStep(){

    // STEP 1 Validation

    if(currentStep === 0){

        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("email").value.trim();
        const phone = document.getElementById("phone").value.trim();

        if(name === ""){
            alert("Please enter your name");
            return false;
        }

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(!emailPattern.test(email)){
            alert("Enter a valid email");
            return false;
        }

        if(phone.length !== 10 || isNaN(phone)){
            alert("Phone number must be 10 digits");
            return false;
        }
    }

    // STEP 2 Validation

    if(currentStep === 1){

        const semester = document.getElementById("semester").value;

        if(semester < 1 || semester > 8){
            alert("Semester must be between 1 and 8");
            return false;
        }
    }

    return true;
}

nextBtns.forEach((btn)=>{

    btn.addEventListener("click", ()=>{

        if(!validateStep()){
            return;
        }

        if(currentStep < steps.length - 1){
            currentStep++;
            showStep(currentStep);
        }

    });

});

prevBtns.forEach((btn)=>{

    btn.addEventListener("click", ()=>{

        if(currentStep > 0){
            currentStep--;
            showStep(currentStep);
        }

    });

});

// Auto Save Inputs

const allInputs = document.querySelectorAll("input, textarea");

allInputs.forEach((field)=>{

    field.addEventListener("input", ()=>{

        localStorage.setItem(field.id, field.value);

    });

});

// Load Saved Data

window.addEventListener("load", ()=>{

    allInputs.forEach((field)=>{

        const savedValue = localStorage.getItem(field.id);

        if(savedValue){
            field.value = savedValue;
        }

    });

});