# Purpose
---

This README serves as the documentation for the Zulu ASR model.

# Data
---

The model is trained with data from the IARPA Babel Zulu Language Pack ("babel") and our research group's collected data ("durban").

## babel
---

The babel dataset consists of scripted and conversational Zulu telephone speech. The data has been further divided into "transcribed" and "untranscribed", as not all clips have a matching transcription. 

The statistics for the data splits are below:
- conversational-transcribed: 27 hours
- conversational-untranscribed: 40 hours
- scripted-transcribed: 22 hours
- scripted-untranscribed: 7.6 hours

## durban
---

The durban dataset consists of conversational Zulu speech. In total, there is around 190 hours of data in the durban dataset. For the purposes of the current model, all the durban data is untranscribed.

### Audio preprocessing
---

The data mainly consists of audio encoded in 8khz SPH format, with some clips being in 48khz WAV. To comply with the format wav2vec2 expects, all audio has been resampled/reformatted to 16khz WAV. 


Additionally, all untranscribed data has been split into 30 second clips in order to avoid out-of-memory (OOM) issues when feeding large clips into the model. In contrast, transcribed data has been split based on pauses indicated by the transcriptions. The transcribed clips still have a maximum duration of 30 seconds, but are split after 1 second of no speech.

### Text preprocessing
---

All instances of non-speech, denoted by IARPA with <>, e.g. "<no-speech>" have been removed. Additionally, words that were unclear to transcribers were generically notated as (()). Such instances have also been removed. Misprounciations, indicated by asterisks, e.g. \*representive\* have had the asterisks removed (but the words kept). The same can be said for stutters, e.g. to-tomorrow: the hyphen has been removed (but the content kept intact). Underscores, used in acronyms e.g. "N\_Y\_C" have been removed. Truncation, marked by a ~, has been removed. 

# Training
---

The model was trained first utilizing all the untranscribed data via continued pre-training (CPT). CPT is a process where a pre-trained checkpoint of a speech model is further pretrained with additional untranscribed data. The checkpoint we use is XLSR-128. After CPT, the model is then fine-tuned on transcribed data. Due to an issue with fairseq, the models are only trained on one of the transcribed datasets. One model was trained on the conversational-transcribed dataset, while the other was trained on the scripted-transcribed dataset. 
