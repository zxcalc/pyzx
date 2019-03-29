// Initial wiring: [0, 9, 11, 6, 2, 7, 8, 12, 10, 14, 1, 3, 13, 4, 5, 15]
// Resulting wiring: [0, 9, 11, 6, 2, 7, 8, 12, 10, 14, 1, 3, 13, 4, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[14], q[13];
cx q[13], q[12];
cx q[13], q[14];
cx q[14], q[15];
cx q[12], q[13];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[13], q[12];
cx q[14], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[11], q[10];
