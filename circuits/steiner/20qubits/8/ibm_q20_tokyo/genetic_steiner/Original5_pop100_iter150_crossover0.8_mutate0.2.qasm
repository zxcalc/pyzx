// Initial wiring: [5, 3, 4, 9, 7, 16, 11, 8, 1, 6, 18, 0, 14, 13, 10, 15, 19, 2, 17, 12]
// Resulting wiring: [5, 3, 4, 9, 7, 16, 11, 8, 1, 6, 18, 0, 14, 13, 10, 15, 19, 2, 17, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[1];
cx q[11], q[8];
cx q[16], q[15];
cx q[19], q[10];
cx q[8], q[9];
cx q[7], q[12];
