// Initial wiring: [0 4 2 3 1 6 8 5 7]
// Resulting wiring: [0 4 2 3 1 6 8 5 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[6], q[7];
cx q[4], q[7];
cx q[5], q[0];
cx q[4], q[3];
