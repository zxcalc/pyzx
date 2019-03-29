// Initial wiring: [16, 11, 12, 6, 2, 10, 1, 5, 18, 9, 3, 7, 0, 15, 13, 17, 19, 4, 14, 8]
// Resulting wiring: [16, 11, 12, 6, 2, 10, 1, 5, 18, 9, 3, 7, 0, 15, 13, 17, 19, 4, 14, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[11], q[9];
cx q[12], q[6];
cx q[6], q[3];
cx q[16], q[13];
cx q[19], q[18];
cx q[19], q[10];
cx q[2], q[8];
