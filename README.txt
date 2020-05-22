Dumitrescu Andrei - 313CC

Partea 1:
La partea 1 am vectorizat putin functia csr_multiplication pentru un timp
mai bun. Pentru a creea matricea de probabilitati am facut initial legaturile
unui nod cu vecinii sai si am considerat ca nr de vecini poate fi 4 5 sau 6.
4 au doar nodurile din colturi, 5 nodurile de pe margine si 6 nodurile 
interioare. Algoritmul pentru Jacobi este cel clasic. Pentru functia 
matrix_to_csr m-am folosit de find() pentru a lua indicii nenuli.
Pentru a creea vectorul rowptr am cautat cu find pentru fiecare linie indicele
primului element nenul.

Partea 2:
Pentru a gasii centroizii am folosit algoritmul descris in enunt. Practic eu
o sa caut o noua pozitie a centroidului pana nu se mai muta si atunci 
conditia de norm(centroids - oldCentroids) > 0.001 va fi false.
Calculul costului a presupus aflarea minimului de la fiecare punct la cel mai 
apropiat centroid.

Partea 3:
Atat la rgbHistogram cat si la hsvHistogram am folosim imread pentru a citi 
imaginile in format RGB ( la HSV am creeat functia RGB2HSV pentru a face
conversia) iar apoi am creeat un vector in care sunt count_bins + 1 elemente,
iar oricare 2 elemente alaturate alcatuiesc un interval din cele 
256 / count_bins ( respectiv 1.01 / count_bins). Dupa aceea, cu functia
histc am numarat pentru fiecare array (R, G, B sau H, S, V) cati pixeli
se afla in intervalele respective si am creeat vectorul de solutii.
SST si Householder sunt algoritmii clasici, nemodificati. In functia de 
preprocess am luat fiecare imagine in parte cu ajutorul functiei dir()
si am creeat matricea X si vectorul y( mai intai am citit pisici apoi ce nu e
pisica). In functia learn am invatat vectorul w cu ajutorul Householder si
SST. In evaluate am citit fiecare imagine din teste si am retinut informatia
in matricea X si l-am aflat pe y1 ca fiind w' * X'. Dupa aceea, toate 
raspunsurile >= 0 le-am retinut in array-ul ANS si am comparat cu raspunsurile
reale si am calculat procentajul.

Partea 4:
Cea mai grea dintre toate. Am folosit functiile de la 3 si algoritmul descris
in enunt. Am incercat sa optimizez rgbHistogram si hsvHistogram pentru a avea
un timp mai bun si astel l-am optimizat si pe 3.

English:

I used as much as I could vectorization techniques in MATLAB.

In the first task I built the probability matrix and applied the Jacobi algorithm.

Task 2 consisted in implementing the K Means algorithm for D-dimensional points.

Task 3 consists of an image classifier with cats.
So I train the model on a set of images and then predict whether
an image contains cats or not. For this task I used RGB and HSV histograms.
In both rgbHistogram and hsvHistogram I used imread to read
images in RGB format (at HSV I created the RGB2HSV function to do
conversion) and then I created a vector with count_bins + 1 elements,
and any 2 adjacent elements make up a range of those
256 / count_bins (respectively 1.01 / count_bins). After that, with the function
histc I counted for each array (R, G, B or H, S, V) how many pixels
is in the respective intervals and I created the solution vector.
SST and Householder are the classic, unmodified algorithms. Depending on
preprocess I took each image separately using the dir () function
and I created the matrix X and the vector y (first I read cats then what is not
the cat). In the learn function I trained the vector w with the help of Householder and
SST. In the evaluations, I read each image from the tests and retained the information
in the matrix X and I found y1 to be w '* X'. After that, all
the answers> = 0 I retained them in the ANS array and compared with the answers
real and I calculated the percentage.

Task 4 was to avoid certain matrix approximation errors.
So I used the gradient descent method to get rid of those errors.

We obtained an accuracy of over 80% for task 3 and over 64% for task 4.
With the help of vectorizations we reduced the running time from 1 hour to 5-40 seconds.


