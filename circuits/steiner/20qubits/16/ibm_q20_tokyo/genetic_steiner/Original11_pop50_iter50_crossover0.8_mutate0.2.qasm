// Initial wiring: [10, 17, 15, 11, 12, 2, 3, 5, 9, 8, 16, 7, 4, 14, 13, 19, 18, 1, 0, 6]
// Resulting wiring: [10, 17, 15, 11, 12, 2, 3, 5, 9, 8, 16, 7, 4, 14, 13, 19, 18, 1, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[10], q[8];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[13];
cx q[15], q[13];
cx q[13], q[6];
cx q[17], q[11];
cx q[19], q[18];
cx q[12], q[18];
cx q[12], q[17];
cx q[10], q[11];
cx q[6], q[7];
cx q[3], q[5];
cx q[2], q[7];
cx q[0], q[1];
