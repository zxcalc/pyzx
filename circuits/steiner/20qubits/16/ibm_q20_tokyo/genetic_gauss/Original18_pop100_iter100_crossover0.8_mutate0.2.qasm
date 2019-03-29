// Initial wiring: [2, 18, 16, 14, 13, 0, 1, 19, 8, 7, 9, 3, 11, 6, 17, 15, 5, 10, 4, 12]
// Resulting wiring: [2, 18, 16, 14, 13, 0, 1, 19, 8, 7, 9, 3, 11, 6, 17, 15, 5, 10, 4, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[7];
cx q[8], q[0];
cx q[11], q[3];
cx q[6], q[5];
cx q[15], q[7];
cx q[17], q[15];
cx q[17], q[13];
cx q[15], q[2];
cx q[18], q[8];
cx q[19], q[15];
cx q[13], q[19];
cx q[3], q[5];
cx q[1], q[2];
cx q[0], q[5];
cx q[0], q[2];
cx q[4], q[9];
