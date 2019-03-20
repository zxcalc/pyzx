// Initial wiring: [0 1 2 5 3 4 7 6 8]
// Resulting wiring: [0 1 2 4 3 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[5], q[0];
cx q[2], q[1];
cx q[8], q[7];
