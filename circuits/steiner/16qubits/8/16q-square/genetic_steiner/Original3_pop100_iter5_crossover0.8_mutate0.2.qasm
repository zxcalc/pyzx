// Initial wiring: [13, 4, 3, 6, 14, 15, 12, 0, 7, 9, 1, 5, 2, 8, 11, 10]
// Resulting wiring: [13, 4, 3, 6, 14, 15, 12, 0, 7, 9, 1, 5, 2, 8, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[0];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[6], q[7];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[5];
cx q[1], q[6];
cx q[6], q[7];
cx q[7], q[6];
