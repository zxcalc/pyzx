// Initial wiring: [0, 13, 17, 9, 16, 7, 19, 5, 4, 12, 11, 15, 3, 1, 2, 18, 14, 6, 10, 8]
// Resulting wiring: [0, 13, 17, 9, 16, 7, 19, 5, 4, 12, 11, 15, 3, 1, 2, 18, 14, 6, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[3], q[2];
cx q[8], q[1];
cx q[12], q[6];
cx q[6], q[3];
cx q[12], q[6];
cx q[16], q[13];
cx q[11], q[17];
cx q[2], q[3];
