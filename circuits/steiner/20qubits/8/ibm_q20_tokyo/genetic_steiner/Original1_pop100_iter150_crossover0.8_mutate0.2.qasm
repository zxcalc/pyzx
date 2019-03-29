// Initial wiring: [0, 18, 14, 13, 2, 4, 3, 12, 19, 5, 16, 8, 9, 6, 17, 10, 15, 11, 7, 1]
// Resulting wiring: [0, 18, 14, 13, 2, 4, 3, 12, 19, 5, 16, 8, 9, 6, 17, 10, 15, 11, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[7], q[2];
cx q[11], q[9];
cx q[11], q[12];
cx q[7], q[13];
cx q[7], q[12];
cx q[4], q[5];
cx q[3], q[5];
