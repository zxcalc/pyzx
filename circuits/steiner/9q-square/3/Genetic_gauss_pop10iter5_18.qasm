// Initial wiring: [0 1 4 2 3 5 7 6 8]
// Resulting wiring: [0 1 4 2 3 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[5], q[0];
cx q[4], q[5];
