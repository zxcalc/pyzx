// Initial wiring: [12, 17, 14, 10, 11, 5, 16, 8, 4, 18, 15, 19, 6, 3, 9, 7, 2, 13, 1, 0]
// Resulting wiring: [12, 17, 14, 10, 11, 5, 16, 8, 4, 18, 15, 19, 6, 3, 9, 7, 2, 13, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[11], q[10];
cx q[15], q[14];
cx q[19], q[18];
cx q[18], q[12];
cx q[7], q[13];
cx q[4], q[6];
cx q[0], q[9];
