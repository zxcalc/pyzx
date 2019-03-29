// Initial wiring: [0, 9, 19, 8, 6, 11, 1, 12, 16, 3, 18, 14, 7, 4, 15, 17, 2, 10, 13, 5]
// Resulting wiring: [0, 9, 19, 8, 6, 11, 1, 12, 16, 3, 18, 14, 7, 4, 15, 17, 2, 10, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[14], q[13];
cx q[14], q[5];
cx q[18], q[12];
cx q[7], q[8];
cx q[6], q[13];
cx q[5], q[6];
cx q[1], q[2];
