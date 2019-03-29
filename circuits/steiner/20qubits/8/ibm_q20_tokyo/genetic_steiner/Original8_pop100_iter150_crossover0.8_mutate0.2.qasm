// Initial wiring: [2, 11, 4, 18, 10, 14, 17, 15, 1, 6, 8, 7, 0, 3, 19, 9, 5, 13, 16, 12]
// Resulting wiring: [2, 11, 4, 18, 10, 14, 17, 15, 1, 6, 8, 7, 0, 3, 19, 9, 5, 13, 16, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[7], q[1];
cx q[8], q[2];
cx q[15], q[14];
cx q[17], q[11];
cx q[19], q[18];
cx q[8], q[9];
cx q[1], q[8];
