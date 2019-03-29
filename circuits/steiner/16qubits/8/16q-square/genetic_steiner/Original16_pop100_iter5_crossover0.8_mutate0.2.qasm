// Initial wiring: [15, 13, 2, 4, 5, 10, 7, 6, 1, 12, 8, 3, 14, 0, 11, 9]
// Resulting wiring: [15, 13, 2, 4, 5, 10, 7, 6, 1, 12, 8, 3, 14, 0, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[4];
cx q[14], q[9];
cx q[11], q[12];
cx q[9], q[14];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[13];
cx q[6], q[7];
cx q[4], q[11];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[12];
cx q[12], q[11];
