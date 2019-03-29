// Initial wiring: [3, 4, 15, 1, 14, 12, 0, 13, 6, 7, 11, 10, 5, 2, 8, 9]
// Resulting wiring: [3, 4, 15, 1, 14, 12, 0, 13, 6, 7, 11, 10, 5, 2, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[13];
cx q[10], q[13];
cx q[1], q[6];
cx q[6], q[7];
cx q[0], q[1];
