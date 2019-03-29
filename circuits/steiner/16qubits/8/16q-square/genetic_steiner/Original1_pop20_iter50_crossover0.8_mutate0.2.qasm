// Initial wiring: [5, 6, 8, 15, 14, 3, 11, 7, 0, 13, 4, 2, 1, 12, 9, 10]
// Resulting wiring: [5, 6, 8, 15, 14, 3, 11, 7, 0, 13, 4, 2, 1, 12, 9, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[12], q[11];
cx q[13], q[14];
cx q[11], q[12];
cx q[12], q[11];
cx q[9], q[14];
cx q[4], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[4], q[5];
cx q[12], q[11];
