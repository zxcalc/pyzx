// Initial wiring: [19, 5, 18, 14, 6, 4, 1, 15, 0, 9, 3, 8, 11, 17, 7, 2, 13, 10, 12, 16]
// Resulting wiring: [19, 5, 18, 14, 6, 4, 1, 15, 0, 9, 3, 8, 11, 17, 7, 2, 13, 10, 12, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[0];
cx q[12], q[6];
cx q[16], q[14];
cx q[18], q[19];
cx q[7], q[12];
