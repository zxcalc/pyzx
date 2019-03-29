// Initial wiring: [12, 6, 13, 3, 8, 2, 1, 4, 0, 14, 7, 11, 9, 5, 15, 10]
// Resulting wiring: [12, 6, 13, 3, 8, 2, 1, 4, 0, 14, 7, 11, 9, 5, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[11], q[4];
cx q[15], q[8];
cx q[12], q[13];
cx q[5], q[6];
cx q[6], q[7];
cx q[1], q[2];
