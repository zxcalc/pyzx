// Initial wiring: [0, 7, 5, 3, 2, 10, 13, 11, 14, 15, 8, 12, 6, 4, 1, 9]
// Resulting wiring: [0, 7, 5, 3, 2, 10, 13, 11, 14, 15, 8, 12, 6, 4, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[13], q[12];
cx q[13], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[0], q[7];
cx q[7], q[8];
