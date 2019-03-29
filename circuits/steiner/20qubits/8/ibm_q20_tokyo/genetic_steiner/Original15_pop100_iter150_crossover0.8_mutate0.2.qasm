// Initial wiring: [14, 15, 3, 13, 8, 6, 2, 16, 11, 10, 0, 12, 4, 18, 17, 7, 1, 19, 9, 5]
// Resulting wiring: [14, 15, 3, 13, 8, 6, 2, 16, 11, 10, 0, 12, 4, 18, 17, 7, 1, 19, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[7], q[2];
cx q[18], q[17];
cx q[12], q[13];
cx q[8], q[10];
cx q[6], q[13];
cx q[2], q[3];
cx q[1], q[2];
