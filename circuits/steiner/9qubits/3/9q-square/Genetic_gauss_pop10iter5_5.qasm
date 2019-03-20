// Initial wiring: [5 1 2 3 4 0 7 6 8]
// Resulting wiring: [5 1 2 3 4 0 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[1], q[4];
cx q[6], q[7];
