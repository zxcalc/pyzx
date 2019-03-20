// Initial wiring: [0 1 2 4 7 5 6 3 8]
// Resulting wiring: [0 2 1 4 6 5 7 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[4];
cx q[8], q[7];
cx q[4], q[7];
cx q[3], q[2];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[0], q[1];
cx q[7], q[8];
cx q[8], q[7];
