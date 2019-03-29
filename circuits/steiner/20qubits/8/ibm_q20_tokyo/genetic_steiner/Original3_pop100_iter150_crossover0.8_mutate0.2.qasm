// Initial wiring: [1, 4, 16, 9, 12, 7, 10, 13, 8, 19, 14, 17, 11, 18, 6, 2, 3, 15, 5, 0]
// Resulting wiring: [1, 4, 16, 9, 12, 7, 10, 13, 8, 19, 14, 17, 11, 18, 6, 2, 3, 15, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[4], q[3];
cx q[6], q[5];
cx q[9], q[0];
cx q[10], q[9];
cx q[16], q[15];
cx q[19], q[18];
cx q[7], q[12];
