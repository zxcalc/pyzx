// Initial wiring: [7, 12, 3, 5, 6, 4, 15, 9, 11, 13, 10, 2, 1, 14, 0, 8]
// Resulting wiring: [7, 12, 3, 5, 6, 4, 15, 9, 11, 13, 10, 2, 1, 14, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[12];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[7];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
