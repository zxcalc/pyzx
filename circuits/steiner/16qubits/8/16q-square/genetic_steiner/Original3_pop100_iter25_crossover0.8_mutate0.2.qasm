// Initial wiring: [1, 13, 0, 7, 9, 4, 3, 15, 12, 14, 5, 10, 11, 2, 8, 6]
// Resulting wiring: [1, 13, 0, 7, 9, 4, 3, 15, 12, 14, 5, 10, 11, 2, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[13], q[10];
cx q[14], q[13];
cx q[11], q[12];
cx q[12], q[13];
