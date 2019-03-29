// Initial wiring: [17, 8, 10, 13, 16, 6, 18, 19, 0, 12, 2, 3, 4, 5, 7, 1, 14, 11, 9, 15]
// Resulting wiring: [17, 8, 10, 13, 16, 6, 18, 19, 0, 12, 2, 3, 4, 5, 7, 1, 14, 11, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[11], q[10];
cx q[11], q[9];
cx q[12], q[11];
cx q[19], q[18];
cx q[18], q[17];
cx q[13], q[15];
cx q[12], q[13];
cx q[11], q[17];
cx q[11], q[12];
cx q[9], q[11];
cx q[11], q[17];
cx q[8], q[11];
cx q[11], q[12];
cx q[12], q[17];
cx q[8], q[9];
cx q[12], q[11];
cx q[4], q[5];
