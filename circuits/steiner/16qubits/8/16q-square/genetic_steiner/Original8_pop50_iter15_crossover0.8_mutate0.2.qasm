// Initial wiring: [15, 11, 14, 4, 9, 5, 1, 12, 7, 0, 8, 3, 2, 6, 13, 10]
// Resulting wiring: [15, 11, 14, 4, 9, 5, 1, 12, 7, 0, 8, 3, 2, 6, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[13], q[14];
cx q[12], q[13];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
